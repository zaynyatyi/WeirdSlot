package com.nailedgames.app;

import com.nailedgames.app.ApplicationView;
import com.nailedgames.app.ApplicationViewMediator;
import com.nailedgames.slot.commands.InitializeCommand;
import com.nailedgames.slot.commands.LoopCommand;
import com.nailedgames.slot.commands.RollCommand;
import com.nailedgames.slot.models.CardModel;
import com.nailedgames.slot.models.FieldModel;
import com.nailedgames.slot.models.RollModel;
import com.nailedgames.slot.models.RollsModel;
import com.nailedgames.slot.signals.InitializeSignal;
import com.nailedgames.slot.signals.LoopSignal;
import com.nailedgames.slot.signals.RollSignal;
import com.nailedgames.slot.signals.UpdateFieldSignal;
import com.nailedgames.slot.views.ControlsView;
import com.nailedgames.slot.views.ControlsViewMediator;
import com.nailedgames.slot.views.FieldView;
import mmvc.api.IViewContainer;
import mmvc.impl.Context;
import src.com.nailedgames.slot.views.FieldViewMediator;

class ApplicationContext extends Context
{
	public function new(?contextView:IViewContainer = null, ?autoStartup:Bool = true)
	{
		super(contextView, autoStartup);
	}

	override public function startup():Void
	{
		super.startup();
		//Mapping commands and signals
		commandMap.mapSignalClass(InitializeSignal, InitializeCommand, true);
		commandMap.mapSignalClass(LoopSignal, LoopCommand);
		commandMap.mapSignalClass(RollSignal, RollCommand);

		//Mapping models
		injector.mapSingleton(CardModel);
		injector.mapSingleton(RollModel);
		injector.mapSingleton(RollsModel);
		injector.mapSingleton(FieldModel);

		//Mapping views and mediators
		mediatorMap.mapView(FieldView, FieldViewMediator);
		mediatorMap.mapView(ControlsView, ControlsViewMediator);

		//Mapping signals which will be used by mediators to update related views
		injector.mapSingleton(UpdateFieldSignal);

		//Wiring for main application module
		mediatorMap.mapView(ApplicationView, ApplicationViewMediator);
	}

	/**
	Overrides shutdown to remove/cleanup mappings
	@see mmvc.impl.Context
	*/
	override public function shutdown()
	{
		super.shutdown();
	}
}