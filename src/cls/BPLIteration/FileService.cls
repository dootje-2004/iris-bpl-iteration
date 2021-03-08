Class BPLIteration.FileService Extends Ens.BusinessService
{

Parameter ADAPTER = "EnsLib.File.InboundAdapter";

Method OnProcessInput(pInput As %Stream.Object, Output pOutput As %RegisteredObject) As %Status
{
	set req = ##class(BPLIteration.Msg.MultipleQuestionsRequest).%New()

	while 'pInput.AtEnd {
		set line = pInput.ReadLine(,.st,.eol)
		if eol="" quit
		
		set question = ##class(BPLIteration.Msg.Question).%New()
		set question.Subject = $piece(line, ":", 1)
		set options = $piece(line, ":", 2)
		set len = $length(options, ",")
		for i=1:1:len {
			set st = question.Options.Insert($piece(options, ",", i))
		}
		set st = req.Questions.Insert(question)
	}
	set st = ..SendRequestAsync("MultipleQuestionsBPL", req)
	quit st
}

}
