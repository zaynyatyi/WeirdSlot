package src.com.nailedgames.slot.views;

import com.nailedgames.slot.models.FieldModel;
import com.nailedgames.slot.views.FieldView;
import mmvc.impl.Mediator;

/**
 * ...
 * @author Heorhiy Kharvat
 */
class FieldViewMediator extends Mediator<FieldView>
{
	@inject public var fieldModel:FieldModel;

	public function new()
	{
		super();
	}

	override public function onRegister():Void
	{
		super.onRegister();
	}

	override public function onRemove():Void
	{
		super.onRemove();
	}
}
