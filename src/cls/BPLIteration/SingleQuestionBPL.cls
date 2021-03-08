/// 
Class BPLIteration.SingleQuestionBPL Extends Ens.BusinessProcessBPL
{

/// BPL Definition
XData BPL [ XMLNamespace = "http://www.intersystems.com/bpl" ]
{
<process language='objectscript' request='BPLIteration.Msg.SingleQuestionRequest' response='BPLIteration.Msg.AnswerResponse' height='2000' width='2000' >
<context>
<property name='k1' type='%Integer' instantiate='0' />
<property name='WorkflowActions' type='%String' instantiate='0' >
<parameters>
<parameter name='MAXLEN'  value='500' />
</parameters>
</property>
<property name='WorkflowMessage' type='%String' initialexpression='"Please choose an option for "' instantiate='0' >
<parameters>
<parameter name='MAXLEN'  value='2000' />
</parameters>
</property>
</context>
<sequence xend='200' yend='750' >
<assign name="Append subject to message" property="context.WorkflowMessage" value="context.WorkflowMessage_request.Subject" action="set" xpos='200' ypos='250' />
<foreach name='Iterate over options' property='request.Options' key='context.k1' xpos='200' ypos='350' xend='200' yend='450' >
<assign name="Assemble actions" property="context.WorkflowActions" value="$LTS($LFS(context.WorkflowActions) _ $LB(request.Options.GetAt(context.k1)))" action="set" xpos='200' ypos='250' >
<annotation><![CDATA[Add the current option to the workflow actions]]></annotation>
</assign>
<assign name="Assemble message content" property="context.WorkflowMessage" value="context.WorkflowMessage_$c(13,10)_request.Options.GetAt(context.k1)" action="set" xpos='200' ypos='350' />
</foreach>
<call name='Call to workflow' target='Guru' async='1' xpos='200' ypos='450' >
<request type='EnsLib.Workflow.TaskRequest' >
<assign property="callrequest.%Actions" value="context.WorkflowActions" action="set" />
<assign property="callrequest.%Subject" value="request.Subject" action="set" />
<assign property="callrequest.%Message" value="context.WorkflowMessage" action="set" />
</request>
<response type='EnsLib.Workflow.TaskResponse' >
<assign property="response.Choice" value="callresponse.%Action" action="set" />
<assign property="response.Subject" value="callresponse.%Subject" action="set" />
</response>
</call>
<sync name='Wait for workflow' calls='Call to workflow' type='all' xpos='200' ypos='550' />
<call name='Write to File' target='FileOperation' async='1' xpos='200' ypos='650' >
<request type='BPLIteration.Msg.FileRequest' >
<assign property="callrequest.Subject" value="response.Subject" action="set" />
<assign property="callrequest.Choice" value="response.Choice" action="set" />
</request>
</call>
</sequence>
</process>
}

Storage Default
{
<Type>%Storage.Persistent</Type>
}

}
