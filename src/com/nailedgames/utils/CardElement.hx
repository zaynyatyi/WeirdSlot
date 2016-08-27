package com.nailedgames.utils;

/**
 * ...
 * @author Heorhiy Kharvat
 */
abstract CardElement(String)
{
	inline public function new(element:String) {
		this = element;
	}

	public inline function getUrl():String {
		return '${Settings.instance.assetsUrl}/${this}.png';
	}
}