package com.nailedgames;

import com.nailedgames.app.ApplicationContext;
import com.nailedgames.app.ApplicationView;

/**
 * ...
 * @author Heorhiy Kharvat
 */
class Main
{
	static function main()
	{
		var applicationView:ApplicationView = new ApplicationView();
		var applicationContext:ApplicationContext = new ApplicationContext(applicationView);
	}
}
