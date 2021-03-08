/// 
Class BPLIteration.MultipleQuestionsBPL Extends Ens.BusinessProcessBPL
{

/// BPL Definition
XData BPL [ XMLNamespace = "http://www.intersystems.com/bpl" ]
{
<process language='objectscript' request='BPLIteration.Msg.MultipleQuestionsRequest' height='2000' width='2000' >
<context>
<property name='k1' type='%Integer' instantiate='0' />
<property name='ListOfCalls' type='%String' initialexpression='""' instantiate='0' >
<parameters>
<parameter name='MAXLEN'  value='250' />
</parameters>
</property>
<property name='CallName' type='%String' instantiate='0' >
<parameters>
<parameter name='MAXLEN'  value='50' />
</parameters>
</property>
<property name='Answers' type='%String' initialexpression='""' instantiate='0' >
<parameters>
<parameter name='MAXLEN'  value='1000' />
</parameters>
</property>
</context>
<sequence xend='200' yend='850' >
<trace name='# items' value='"# items = " _ request.Questions.Count()' xpos='200' ypos='250' />
<foreach name='Iterate over questions' property='request.Questions' key='context.k1' xpos='200' ypos='350' xend='200' yend='650' >
<trace name='Current subject' value='request.Questions.GetAt(context.k1).Subject' xpos='200' ypos='250' />
<assign name="Set CallName" property="context.CallName" value="&quot;Call&quot; _ context.k1" action="set" xpos='200' ypos='350' />
<assign name="Assemble ListOfCalls" property="context.ListOfCalls" value="context.ListOfCalls _ $LB(context.CallName)" action="set" xpos='200' ypos='450' />
<call name='@context.CallName' target='SingleQuestionBPL' async='1' xpos='200' ypos='550' >
<request type='BPLIteration.Msg.SingleQuestionRequest' >
<assign property="callrequest" value="request.Questions.GetAt(context.k1)" action="set" />
</request>
<response type='BPLIteration.Msg.AnswerResponse' >
<assign property="context.Answers" value="context.Answers _ $LB(callresponse.Subject _ &quot;:&quot; _ callresponse.Choice)" action="set" />
</response>
</call>
</foreach>
<assign name="Convert call names" property="context.ListOfCalls" value="$LTS(context.ListOfCalls,&quot;,&quot;)" action="set" xpos='200' ypos='450' />
<sync name='Wait for all responses' calls='@context.ListOfCalls' type='all' xpos='200' ypos='550' />
<trace name='Trace results' value='$LTS(context.Answers,"|")' xpos='200' ypos='650' />
<call name='Write summary to file' target='FileOperation' async='1' xpos='200' ypos='750' >
<request type='BPLIteration.Msg.FileRequest' >
<assign property="callrequest.Choice" value="$LTS(context.Answers)" action="set" />
<assign property="callrequest.Subject" value="&quot;Summary&quot;" action="set" />
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
