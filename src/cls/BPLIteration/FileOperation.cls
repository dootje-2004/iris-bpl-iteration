Class BPLIteration.FileOperation Extends Ens.BusinessOperation
{

Parameter ADAPTER = "EnsLib.File.OutboundAdapter";

Parameter INVOCATION = "Queue";

Parameter Filename = "AnswerStore.txt";

Method StoreAnswer(pRequest As BPLIteration.Msg.FileRequest, Output pResponse As Ens.Response) As %Status
{
	quit ..Adapter.PutLine(..#Filename, pRequest.Subject _ ": " _ pRequest.Choice)
}

XData MessageMap
{
<MapItems>
	<MapItem MessageType="BPLIteration.Msg.FileRequest"> 
		<Method>StoreAnswer</Method>
	</MapItem>
</MapItems>
}

}
