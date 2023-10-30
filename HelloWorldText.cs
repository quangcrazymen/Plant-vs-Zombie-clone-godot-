using Godot;
using System;

public partial class HelloWorldText : RichTextLabel
{
	// Called when the node enters the scene tree for the first time.
	public override void _Ready()
	{
		Console.WriteLine("Hello world");
        GD.Print("Hello from C# to Godot :)");
		
    }


    // Called every frame. 'delta' is the elapsed time since the previous frame.
    public override void _Process(double delta)
	{
		//GD.Print("Updating ...");
		

	}
}
