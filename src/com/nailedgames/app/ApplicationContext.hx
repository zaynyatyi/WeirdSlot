package com.nailedgames.app;

import com.nailedgames.app.ApplicationView;
import com.nailedgames.app.ApplicationViewMediator;
import com.nailedgames.slot.models.FieldModel;
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
		//Mapping models
		injector.mapSingleton(FieldModel);

		//Mapping views and mediators
		mediatorMap.mapView(FieldView, FieldViewMediator);

		//Wiring for main application module
		mediatorMap.mapView(ApplicationView, ApplicationViewMediator);
	}

	/**
	Overrides shutdown to remove/cleanup mappings
	@see mmvc.impl.Context
	*/
	override public function shutdown()
	{
	}
}