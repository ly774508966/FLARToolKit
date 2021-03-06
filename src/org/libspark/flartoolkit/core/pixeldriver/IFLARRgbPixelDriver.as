/* 
 * PROJECT: FLARToolKit
 * --------------------------------------------------------------------------------
 * This work is based on the FLARToolKit developed by
 *   R.Iizuka (nyatla)
 * http://nyatla.jp/nyatoolkit/
 *
 * The FLARToolKit is ActionScript 3.0 version ARToolkit class library.
 * Copyright (C)2008 Saqoosha
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 * 
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 * 
 * For further information please contact.
 *	http://www.libspark.org/wiki/saqoosha/FLARToolKit
 *	<saq(at)saqoosha.net>
 * 
 */
package org.libspark.flartoolkit.core.pixeldriver
{

	import org.libspark.flartoolkit.core.FLARException;
	import org.libspark.flartoolkit.core.raster.rgb.*;
	import org.libspark.flartoolkit.core.raster.*;
	import org.libspark.flartoolkit.core.types.*;

	/**
	 * このインタフェイスは、ラスタからRGBピクセル値を読みだす関数を定義します。 {@link IFLARRgbRaster}
	 * インタフェイスを実装したクラスで使うことを想定しています。 RGBデータは、0から255までの範囲を持ちます。
	 * <p>
	 * このインタフェイスは、画素アクセサとして高頻度でコールされることが予想されます。そのため、画素形式のマッチング等は排除するようにしてください。
	 * </p>
	 */
	public interface IFLARRgbPixelDriver
	{
		/**
		 * この関数は、ピクセルドライバの参照するラスタのサイズを返します。
		 * @return
		 * [readonly]
		 */
		function getSize():FLARIntSize;
		/**
		 * この関数は、指定した座標の1ピクセル分のRGBデータを、配列に格納して返します。
		 * 実装クラスでは、バッファから指定した座標のRGB値を取得する処理を実装してください。
		 * 
		 * @param i_x
		 *            取得するピクセルの座標。画像の範囲内である事。
		 * @param i_y
		 *            取得するピクセルの座標。画像の範囲内である事。
		 * @param i_rgb
		 *            ピクセル値を返却する配列を指定します。3要素以上の配列が必要です。 値は、[R][G][B]の順に格納します。
		 * @throws FLARException
		 */
		function getPixel(i_x:int,i_y:int,i_rgb:Vector.<int>):void;

		/**
		 * この関数は、座標群から、ピクセルごとのRGBデータを、配列に格納して返します。
		 * 実装クラスでは、バッファから、座標軍のRGB値を取得する処理を実装してください。
		 * 
		 * @param i_x
		 *            取得するピクセルの座標配列。画像の範囲内である事。
		 * @param i_y
		 *            取得するピクセルの座標配列。画像の範囲内である事。
		 * @param i_num
		 *            取得するピクセルの数を指定します。
		 * @param i_intrgb
		 *            ピクセル値を返却する配列を指定します。3要素以上の配列が必要です。
		 *            値は、[R1][G1][B1][R2][G2][B2]の順に格納します。
		 * @throws FLARException
		 */
		function getPixelSet(i_x:Vector.<int>,i_y:Vector.<int>,i_num:int,i_intrgb:Vector.<int>):void;

		/**
		 * この関数は、RGBデータを指定した座標のピクセルにセットします。 実装クラスでは、バッファにRGB値を書込む処理を実装してください。
		 * 
		 * @param i_x
		 *            書込むピクセルの座標。画像の範囲内である事。
		 * @param i_y
		 *            書込むピクセルの座標。画像の範囲内である事。
		 * @param i_r
		 *            R成分のピクセル値。
		 * @param i_g
		 *            G成分のピクセル値。
		 * @param i_b
		 *            B成分のピクセル値。
		 * @throws FLARException
		 */
		function setPixel(i_x:int,i_y:int,i_r:int,i_g:int,i_b:int):void;

		/**
		 * この関数は、RGBデータを指定した座標のピクセルにセットします。 実装クラスでは、バッファにRGB値を書込む処理を実装してください。
		 * 
		 * @param i_x
		 *            書込むピクセルの座標。画像の範囲内である事。
		 * @param i_y
		 *            書込むピクセルの座標。画像の範囲内である事。
		 * @param i_rgb
		 *            設定するピクセル値。3要素以上の配列が必要です。 値は、[R][G][B]の順に格納します。
		 * @throws FLARException
		 */
		function setPixel_2(i_x:int,i_y:int,i_rgb:Vector.<int>):void;

		/**
		 * この関数は、座標群にピクセルごとのRGBデータをセットします。 実装クラスでは、バッファにRGB値を書込む処理を実装してください。
		 * 
		 * @param i_x
		 *            取得するピクセルの座標配列。画像の範囲内である事。
		 * @param i_y
		 *            取得するピクセルの座標配列。画像の範囲内である事。
		 * @param i_num
		 *            設定するピクセルの数を指定します。
		 * @param i_intrgb
		 *            設定するピクセル値を格納する配列を指定します。3×i_num要素以上の配列が必要です。
		 *            値は、[R1][G1][B1][R2][G2][B2]の順に格納します。
		 * @throws FLARException
		 */
		function setPixels(i_x:Vector.<int>,i_y:Vector.<int>,i_num:int,i_intrgb:Vector.<int>):void;

		/**
		 * この関数は、新しいラスタをインスタンスにセットします。
		 * 
		 * @throws FLARException
		 */
		function switchRaster(i_raster:IFLARRgbRaster):void;
	}
}
