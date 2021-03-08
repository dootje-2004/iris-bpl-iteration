Class BPLIteration.Setup Extends %Projection.AbstractProjection
{

Projection Setup As BPLIteration.Setup;

ClassMethod CreateProjection(ClassName As %String, ByRef Params) As %Status
{
	set ns = $namespace

	// Check if this namespace is interoperability-enabled.
	if '##class(%Library.EnsembleMgr).IsEnsembleNamespace(ns) do ##class(%Library.EnsembleMgr).EnableNamespace(ns,1)
	
	// Promote SuperUser to workflow user with workflow role 'Guru'.
	do ##class(EnsLib.Workflow.UserDefinition).CreateUser("SuperUser")
	do ##class(EnsLib.Workflow.RoleDefinition).CreateRole("Guru")
	do ##class(EnsLib.Workflow.RoleDefinition).AddUserToRole("Guru","SuperUser")
	
	// Activate Analytics and password authentication.
	znspace "%SYS"
	set app = $system.CSP.GetDefaultApp(ns)
	set p("DeepSeeEnabled") = 1
	set p("AutheEnabled")= 32
	do ##class(Security.Applications).Modify(app, .p)
	znspace ns

	quit $$$OK
}

}
