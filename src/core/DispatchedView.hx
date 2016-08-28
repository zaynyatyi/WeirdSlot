package core;
import msignal.Signal.Signal0;

/**
 * ...
 * @author Heorhiy Kharvat
 *
 * Dispatched view has map of signals which can be mapped with mediator.
 * So UI signals can be patfrom dependant, but internal app signals will be crossplatform.
 */
class DispatchedView extends View
{
	public var signals:Map<String, Signal0>;

	public function new()
	{
		super();
	}

	override function initialize()
	{
		super.initialize();
		initializeSignals();
	}

	function initializeSignals():Void
	{
		signals = new Map();
	}

	override function remove()
	{
		super.remove();
		for (signal in signals) {
			signal.removeAll();
		}
	}
}