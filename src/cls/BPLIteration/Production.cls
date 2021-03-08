Class BPLIteration.Production Extends Ens.Production
{

XData ProductionDefinition
{
<Production Name="BPLIteration.Production" TestingEnabled="true" LogGeneralTraceEvents="true">
  <Description>Shows iteration over a variable number of calls in a Business Process.</Description>
  <ActorPoolSize>2</ActorPoolSize>
  <Item Name="FileOperation" Category="" ClassName="BPLIteration.FileOperation" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
    <Setting Target="Adapter" Name="FilePath">/scan/out/</Setting>
  </Item>
  <Item Name="FileService" Category="" ClassName="BPLIteration.FileService" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
    <Setting Target="Adapter" Name="FilePath">/scan/in/</Setting>
    <Setting Target="Adapter" Name="FileSpec">Question*</Setting>
  </Item>
  <Item Name="SingleQuestionBPL" Category="" ClassName="BPLIteration.SingleQuestionBPL" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
  </Item>
  <Item Name="MultipleQuestionsBPL" Category="" ClassName="BPLIteration.MultipleQuestionsBPL" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
  </Item>
  <Item Name="Guru" Category="" ClassName="EnsLib.Workflow.Operation" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
</Production>
}

}
