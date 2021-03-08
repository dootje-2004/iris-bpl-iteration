# IRIS BPL iteration

Example of a Business Process with an arbitrary number of call requests.

## What does this example showcase?

Requests passing through an IRIS production may cause a Business Process to
execute a certain call action repeatedly, with the number of repetitions unknown.
This example shows how to deal with that.

The production in this example reads a file with an arbitrary number of questions, each with a varying number of possible answers.
The questions are forwarded to a workflow operation, where the IRIS user *SuperUser* picks one of
the choices as an answer.
Each answer is written to a file, as is the summary of all the answers.

## How do I get this example to run?

1. Clone this repository and import the ObjectScript classes into an IRIS instance.
2. Configure the *File Path* settings of both the *FileService* and *FileOperation* components to point to existing directories on your machine.
3. Start *BPLIteration.Production*.
4. Copy the `QuestionsSamples.txt` file into the *File Path* directory of *FileService*
5. Look at the visual trace.
6. Log in as *SuperUser*, open the workflow dashboard and process the workflow tasks.
7. Refresh the visual trace to see the effect.
8. Have a look at *BPLIteration.MultipleQuestionsBLP* and *BPLIteration.SingleQuestionBPL* to see how the variable number of call requests is handled.

## Additional remarks

Upon compilation, the *Setup* class does a few preparatory things:

* it makes the current namespace interoperability-enabled;
* it promotes the standard IRIS user *SuperUser* to a workflow user;
* it creates a workflow role *Guru* and assigns it to *SuperUser*;
* it activates Analytics for the current namespace and sets password authentication for the current namespace, so *SuperUser* can access the workflow dashboard.
