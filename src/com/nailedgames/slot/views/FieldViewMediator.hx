package src.com.nailedgames.slot.views;

import com.nailedgames.slot.models.FieldModel;
import com.nailedgames.slot.signals.InitializeSignal;
import com.nailedgames.slot.signals.LoopSignal;
import com.nailedgames.slot.signals.UpdateFieldSignal;
import com.nailedgames.slot.views.FieldView;
import com.nailedgames.utils.Settings;
import haxe.Timer;
import mmvc.impl.Mediator;

/**
 * ...
 * @author Heorhiy Kharvat
 */
class FieldViewMediator extends Mediator<FieldView>
{
	@inject public var loopSignal:LoopSignal;
	@inject public var updateFieldSignal:UpdateFieldSignal;
	@inject public var fieldModel:FieldModel;

	var loopTimer:Timer;

	public function new()
	{
		super();
		//We have to reuest updates from view since it's "user" action
		//It will be easy to implement step by step update based on user input in that way
		loopTimer = new Timer(Std.int(1000 / Settings.instance.fps));
	}

	override public function onRegister():Void
	{
		super.onRegister();
		mediate(updateFieldSignal.add(handleUpdateField));
		loopTimer.run = requestFrameUpdate;
	}

	override public function onRemove():Void
	{
		super.onRemove();
	}

	function handleUpdateField():Void
	{
		view.setData(fieldModel, true);
	}

	function requestFrameUpdate():Void
	{
		loopSignal.dispatch();
	}
}
