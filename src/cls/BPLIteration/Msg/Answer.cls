Class BPLIteration.Msg.Answer Extends (%SerialObject, %XML.Adaptor)
{

Property Subject As %String(MAXLEN = 200);

Property Choice As %String(MAXLEN = 200);

Storage Default
{
<Data name="AnswerState">
<Value name="1">
<Value>Subject</Value>
</Value>
<Value name="2">
<Value>Choice</Value>
</Value>
</Data>
<State>AnswerState</State>
<StreamLocation>^BPLIteration.Msg.AnswerS</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
