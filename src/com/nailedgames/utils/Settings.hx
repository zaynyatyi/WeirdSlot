package com.nailedgames.utils;

/**
 * ...
 * @author Heorhiy Kharvat
 */

class Settings
{
	//Can also be mapped as singleton using mmvc injector class
	public static var instance(get, null):Settings;

	public var fps(default, null):Int;

	public var fieldColumns(default, null):Int;
	public var fieldRows(default, null):Int;

	public var squareWidth(default, null):Int;
	public var squareHeight(default, null):Int;

	public var chunksCollection(default, null):ChunksCollection;

	public var assetsUrl:String;

	public var minSpeed(default, null):Int;
	public var maxSpeed(default, null):Int;
	public var minIterations(default, null):Int;
	public var maxIterations(default, null):Int;

	public var initialMoney(default, null):Int;
	public var minBet(default, null):Int;
	public var maxBet(default, null):Int;

	//Private constructor, so we can create instance of class just using static instance getter
	function new()
	{
		init();
	}

	function init():Void
	{
		fps = 30;

		fieldColumns = 5;
		fieldRows = 3;

		squareWidth = 120;
		squareHeight = 150;

		minSpeed = 10;
		maxSpeed = 50;
		minIterations = 20;
		maxIterations = 30;

		initialMoney = 100;
		minBet = 1;
		maxBet = 10;

		//We are using compiletime macroses to parse our game objects from json file,
		//and typedef for proper json parsing
		//if experimental define will be used during compilation non-regular json file will be taken
		//it can be defined using '-D experimental'
		#if experimental
		chunksCollection = CompileTime.parseJsonFile("assets/experimental_chunks.json");
		#else
		chunksCollection = CompileTime.parseJsonFile("assets/chunks.json");
		#end

		assetsUrl = "assets/images/";
	}

	static function get_instance():Settings
	{
		if (instance == null) instance = new Settings();
		return instance;
	}
}