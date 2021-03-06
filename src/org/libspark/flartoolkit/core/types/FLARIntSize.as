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
package org.libspark.flartoolkit.core.types
{
	import org.libspark.flartoolkit.core.*;
	public class FLARIntSize
	{
		public var h:int;
		public var w:int;
		/*	public function FLARIntSize()
		 * 	public function FLARIntSize(i_width:int,i_height:int)
		 *	public function FLARIntSize(i_ref_object:FLARIntSize)
		*/
		public function FLARIntSize(...args:Array)
		{
			switch(args.length) {
			case 0:
				{//public function FLARIntSize()
					this.w = 0;
					this.h = 0;
					return;
				}
			case 1:
				if(args[0] is FLARIntSize)
				{
					
					{	//public function FLARIntSize(i_width:int,i_height:int)
						this.w=args[0].w;
						this.h = args[0].h;
						return;
					}
				}
				break;
			case 2:
				{	//public function FLARIntSize(i_ref_object:FLARIntSize)
					this.w=int(args[0]);
					this.h=int(args[1]);
					return;
				}
				break;
			default:
				break;
			}
			throw new FLARException();
		}
		public function setValue(i_w:int,i_h:int):void
		{
			this.w=i_w;
			this.h=i_h;
			return;
		}
		/**
		 * サイズが同一であるかを確認する。
		 * 
		 * @param i_width
		 * @param i_height
		 * @return
		 * @throws FLARException
		 */
		public function isEqualSize(i_width:int,i_height:int):Boolean
		{
			if (i_width == this.w && i_height == this.h) {
				return true;
			}
			return false;
		}

		/**
		 * サイズが同一であるかを確認する。
		 * 
		 * @param i_width
		 * @param i_height
		 * @return
		 * @throws FLARException
		 */
		public function isEqualSize_2(i_size:FLARIntSize):Boolean
		{
			if (i_size.w == this.w && i_size.h == this.h) {
				return true;
			}
			return false;
		}
		public function isInnerSize( i_x:int , i_y:int ):Boolean
		{ 
			return ( i_x <= this.w && i_y <= this.h ) ;
		}
		
		public function isInnerSize_2( i_size:FLARIntSize ):Boolean
		{ 
			return ( i_size.w <= this.w && i_size.h <= this.h ) ;
		}
		
		public function isInnerPoint( i_x:int , i_y:int ):Boolean
		{ 
			return ( i_x < this.w && i_y < this.h && 0 <= i_x && 0 <= i_y ) ;
		}
		
		public function isInnerPoint_2( i_pos:FLARDoublePoint2d ):Boolean
		{ 
			return ( i_pos.x < this.w && i_pos.y < this.h && 0 <= i_pos.x && 0 <= i_pos.y ) ;
		}
		
		public function isInnerPoint_3( i_pos:FLARIntPoint2d ):Boolean
		{ 
			return ( i_pos.x < this.w && i_pos.y < this.h && 0 <= i_pos.x && 0 <= i_pos.y ) ;
		}
		
		public function setAreaRect( i_vertex:Vector.<FLARDoublePoint2d>, i_num_of_vertex:int ):void
		{ 
			var xmax:int , xmin:int , ymax:int , ymin:int ;
			xmin = xmax = int(i_vertex[i_num_of_vertex - 1].x) ;
			ymin = ymax = int(i_vertex[i_num_of_vertex - 1].y) ;
			for ( var i:int = i_num_of_vertex - 2 ; i >= 0 ; i-- )
			{
				if( i_vertex[i].x < xmin ) {
					xmin = int(i_vertex[i].x) ;
				}
				else if( i_vertex[i].x > xmax ) {
					xmax = int(i_vertex[i].x) ;
				}
				
				if( i_vertex[i].y < ymin ) {
					ymin = int(i_vertex[i].y) ;
				}
				else if( i_vertex[i].y > ymax ) {
					ymax = int(i_vertex[i].y) ;
				}
				
			}
			this.h = ymax - ymin + 1 ;
			this.w = xmax - xmin + 1 ;
		}
		
		public function setAreaRect_2( i_vertex:Vector.<FLARIntPoint2d>, i_num_of_vertex:int ):void
		{ 
			var xmax:int , xmin:int , ymax:int , ymin:int ;
			xmin = xmax = int(i_vertex[i_num_of_vertex - 1].x) ;
			ymin = ymax = int(i_vertex[i_num_of_vertex - 1].y) ;
			for( var i:int = i_num_of_vertex - 2 ; i >= 0 ; i-- ) {
				if( i_vertex[i].x < xmin ) {
					xmin = int(i_vertex[i].x) ;
				}
				else if( i_vertex[i].x > xmax ) {
					xmax = int(i_vertex[i].x) ;
				}
				
				if( i_vertex[i].y < ymin ) {
					ymin = int(i_vertex[i].y) ;
				}
				else if( i_vertex[i].y > ymax ) {
					ymax = int(i_vertex[i].y) ;
				}
				
			}
			this.h = ymax - ymin + 1 ;
			this.w = xmax - xmin + 1 ;
		}
	}
}