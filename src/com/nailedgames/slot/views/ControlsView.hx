package com.nailedgames.slot.views;
import com.nailedgames.utils.Settings;
import core.DispatchedView;
import js.Browser;
import js.html.ButtonElement;
import js.html.Document;
import msignal.Signal.Signal0;

/**
 * ...
 * @author Heorhiy Kharvat
 */
class ControlsView extends DispatchedView
{
	public static inline var ROLL_SIGNAL:String = "roll_signal";
	public static inline var RAISE_SIGNAL:String = "raise_signal";
	public static inline var LOWER_SIGNAL:String = "lower_signal";
	public static inline var DENIED_SIGNAL:String = "denied_signal";

	static inline var CONTROLS_HEIGHT:Int = 100;
	static inline var DEFAULT_BUTTON_CLASS:String = "ControlButton";

	var rollButton:ButtonElement;
	var raiseBetButton:ButtonElement;
	var lowerBetButton:ButtonElement;
	var deniedButton:ButtonElement;

	public function new()
	{
		super();
	}

	override function initialize()
	{
		super.initialize();
		rollButton = Browser.document.createButtonElement();
		raiseBetButton = Browser.document.createButtonElement();
		lowerBetButton = Browser.document.createButtonElement();

		rollButton.className = '${DEFAULT_BUTTON_CLASS} RollButton';
		raiseBetButton.className = '${DEFAULT_BUTTON_CLASS} RaiseBet';
		lowerBetButton.className = '${DEFAULT_BUTTON_CLASS} LowerBet';

		rollButton.textContent = "Roll";
		raiseBetButton.textContent = "Raise Bet";
		lowerBetButton.textContent = "Lower Bet";

		element.appendChild(rollButton);
		element.appendChild(raiseBetButton);
		element.appendChild(lowerBetButton);

		rollButton.onclick = handleRollClicked;
		raiseBetButton.onclick = handleRaiseClicked;
		lowerBetButton.onclick = handleLowerClicked;

		deniedButton = Browser.document.createButtonElement();
		deniedButton.className = '${DEFAULT_BUTTON_CLASS} DeniedButton';
		deniedButton.textContent = "Don't ever Touch";
		element.appendChild(deniedButton);
		deniedButton.onclick = handleDeniedClicked;
	}

	override function initializeSignals():Void
	{
		super.initializeSignals();
		signals.set(ROLL_SIGNAL, new Signal0());
		signals.set(RAISE_SIGNAL, new Signal0());
		signals.set(LOWER_SIGNAL, new Signal0());
		signals.set(DENIED_SIGNAL, new Signal0());
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

	override function remove()
	{
		super.remove();
		rollButton.onclick = null;
		raiseBetButton.onclick = null;
		lowerBetButton.onclick = null;
	}

	function handleRollClicked():Void
	{
		signals.get(ROLL_SIGNAL).dispatch();
	}

	function handleRaiseClicked():Void
	{
		signals.get(RAISE_SIGNAL).dispatch();
	}

	function handleLowerClicked():Void
	{
		signals.get(LOWER_SIGNAL).dispatch();
	}

	function handleDeniedClicked():Void
	{
		Browser.alert("Didn't i told you?\nNow restart and get a bit more money!");
		signals.get(DENIED_SIGNAL).dispatch();
	}
}