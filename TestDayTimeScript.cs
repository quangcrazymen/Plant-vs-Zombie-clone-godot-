using Godot;
using System;
using System.Collections.Generic;

public partial class Tile : Sprite2D
{
	public Texture2D mTexture = ResourceLoader.Load("res://Particles/SeedPacketFlash.png") as Texture2D;
	public void PrintTexture()
	{
		if (mTexture != null)
		{
			GD.Print(mTexture.GetWidth());
			GD.Print(mTexture.GetHeight());
		}
	}
	public override void _Ready()
	{
		this.Texture = mTexture;
		this.Position = new Vector2(100.0f, 100.0f);
        Scale = new Vector2((float)Texture.GetWidth() / Texture.GetHeight(), 1.0f);

    }

    public override void _Draw()
    {
        base._Draw();
    }
}
public partial class TestDayTimeScript : Sprite2D
{
	// Called when the node enters the scene tree for the first time.
	Tile GlobalTile;
	public override void _Ready()
	{
		//canvaPos = GetGlobalTransform() * localPos;
		GD.Print("Hello");
		var newNode = new Sprite2D();	
		//newNode.Texture.
		AddChild(newNode) ;
		List<Tile> mTileMap = new List<Tile>();
		//int 
		Tile a = new Tile();
		a.PrintTexture();
		a.Scale = new Vector2((float)a.mTexture.GetWidth()/a.mTexture.GetHeight(),1.0f);
		GlobalTile = a;
		GD.Print("This is scale of a:" + GlobalTile.Scale);
		GD.Print(this.Position);
		GD.Print(this.Scale);
		//for(int)
	}
    public override void _Draw()
    {
        base._Draw();
        Texture2D IcePeaShooter = ResourceLoader.Load("res://Plants/IcePeaShooter.png") as Texture2D;

        GD.Print(IcePeaShooter);
        DrawTexture(IcePeaShooter, new Vector2(100.0f, 20.0f), new Color(1, 1, 0, 1));
        DrawTexture(GlobalTile.mTexture, new Vector2(10.0f, 50.0f), new Color(1, 1, 0, 1));

    }
    // Called every frame. 'delta' is the elapsed time since the previous frame.
    public override void _Process(double delta)
	{
		
	}
}
