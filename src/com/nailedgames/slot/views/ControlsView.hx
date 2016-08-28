package com.nailedgames.slot.views;
import com.nailedgames.utils.Settings;
import core.View;
import js.Browser;
import js.html.ButtonElement;
import js.html.Document;

/**
 * ...
 * @author Heorhiy Kharvat
 */
class ControlsView extends View
{
	static inline var CONTROLS_HEIGHT:Int = 100;
	static inline var DEFAULT_BUTTON_CLASS:String = "ControlButton";

	var rollButton:ButtonElement;
	var raiseBet:ButtonElement;
	var lowerBet:ButtonElement;

	public function new()
	{
		super();
	}

	override function initialize()
	{
		super.initialize();
		rollButton = Browser.document.createButtonElement();
		raiseBet = Browser.document.createButtonElement();
		lowerBet = Browser.document.createButtonElement();

		rollButton.className = '${DEFAULT_BUTTON_CLASS} RollButton';
		raiseBet.className = '${DEFAULT_BUTTON_CLASS} RaiseBet';
		lowerBet.className = '${DEFAULT_BUTTON_CLASS} LowerBet';

		rollButton.textContent = "Roll";
		raiseBet.textContent = "Raise Bet";
		lowerBet.textContent = "Lower Bet";

		element.appendChild(rollButton);
		element.appendChild(raiseBet);
		element.appendChild(lowerBet);
	}

	override function applyStyle():Void
	{
		var settings:Settings = Settings.instance;
		var fieldWidth = settings.fieldColumns * settings.squareWidth;
		var fieldHeight = settings.fieldRows * settings.squareHeight;
		element.style.width = '${fieldWidth}px';
		element.style.height = '${CONTROLS_HEIGHT}px';
		element.style.top = '${fieldHeight}px';

		element.style.marginLeft = '${-fieldWidth / 2}px';
	}
}