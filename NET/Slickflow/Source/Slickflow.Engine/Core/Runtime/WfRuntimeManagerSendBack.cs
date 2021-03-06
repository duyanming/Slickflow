﻿/*
* Slickflow 软件遵循自有项目开源协议，也可联系作者获取企业版商业授权和技术支持；
* 除此之外的使用则视为不正当使用，请您务必避免由此带来的一切商业版权纠纷和损失。
* 
The Slickflow Open License (SfPL 1.0)
Copyright (C) 2014  .NET Workflow Engine Library

1. Slickflow software must be legally used, and should not be used in violation of law, 
   morality and other acts that endanger social interests;
2. Non-transferable, non-transferable and indivisible authorization of this software;
3. The source code can be modified to apply Slickflow components in their own projects 
   or products, but Slickflow source code can not be separately encapsulated for sale or 
   distributed to third-party users;
4. The intellectual property rights of Slickflow software shall be protected by law, and
   no documents such as technical data shall be made public or sold.
5. The enterprise, ultimate and universe version can be provided with commercial license, 
   technical support and upgrade service.
*/

using System;
using System.Threading;
using System.Data.Linq;
using System.Transactions;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Slickflow.Engine.Common;
using Slickflow.Engine.Utility;
using Slickflow.Data;
using Slickflow.Engine.Core.Result;
using Slickflow.Engine.Business.Entity;
using Slickflow.Engine.Business.Manager;
using Slickflow.Engine.Xpdl;
using Slickflow.Engine.Core.Event;
using Slickflow.Engine.Core.Pattern;

namespace Slickflow.Engine.Core.Runtime
{
    /// <summary>
    /// 退回流程运行时
    /// </summary>
    internal class WfRuntimeManagerSendBack : WfRuntimeManager
    {
        /// <summary>
        /// 退回操作的处理逻辑
        /// </summary>
        /// <param name="session">会话</param>
        internal override void ExecuteInstanceImp(IDbSession session)
        {
            var nodeMediatorBackward = new NodeMediatorBackward(base.BackwardContext, session);
            var aim = new ActivityInstanceManager();
            var backMostPreviouslyActivityInstanceID = GetBackwardMostPreviouslyActivityInstanceID();

            //上一步节点是普通节点的退回处理
            nodeMediatorBackward.CreateBackwardActivityTaskTransitionInstance(base.BackwardContext.ProcessInstance,
                base.BackwardContext.BackwardFromActivityInstance,
                BackwardTypeEnum.Sendback,
                backMostPreviouslyActivityInstanceID,
                base.BackwardContext.BackwardToTargetTransitionGUID,
                TransitionTypeEnum.Sendback,
                TransitionFlyingTypeEnum.NotFlying,
                base.ActivityResource,
                session);

            //更新当前办理节点的状态（从准备或运行状态更新为退回状态）
            aim.SendBack(base.BackwardContext.BackwardFromActivityInstance.ID,
                base.ActivityResource.AppRunner,
                session);

            //构造回调函数需要的数据
            WfExecutedResult result = base.WfExecutedResult;
            result.BackwardTaskReceiver = base.BackwardContext.BackwardTaskReceiver;
            result.ReturnDataContext = nodeMediatorBackward.ReturnDataContext;
            result.Status = WfExecutedStatus.Success;
        }
    }
}
