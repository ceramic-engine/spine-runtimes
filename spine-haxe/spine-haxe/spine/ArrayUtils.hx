/******************************************************************************
 * Spine Runtimes License Agreement
 * Last updated April 5, 2025. Replaces all prior versions.
 *
 * Copyright (c) 2013-2025, Esoteric Software LLC
 *
 * Integration of the Spine Runtimes into software or otherwise creating
 * derivative works of the Spine Runtimes is permitted under the terms and
 * conditions of Section 2 of the Spine Editor License Agreement:
 * http://esotericsoftware.com/spine-editor-license
 *
 * Otherwise, it is permitted to integrate the Spine Runtimes into software
 * or otherwise create derivative works of the Spine Runtimes (collectively,
 * "Products"), provided that each user of the Products must obtain their own
 * Spine Editor license and redistribution of the Products in any form must
 * include this license and copyright notice.
 *
 * THE SPINE RUNTIMES ARE PROVIDED BY ESOTERIC SOFTWARE LLC "AS IS" AND ANY
 * EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
 * WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
 * DISCLAIMED. IN NO EVENT SHALL ESOTERIC SOFTWARE LLC BE LIABLE FOR ANY
 * DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
 * (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES,
 * BUSINESS INTERRUPTION, OR LOSS OF USE, DATA, OR PROFITS) HOWEVER CAUSED AND
 * ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF
 * THE SPINE RUNTIMES, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*****************************************************************************/

package spine;

class ArrayUtils {
	public static function resize<T>(array:Array<T>, count:Int, value:T) {
		if (count < 0)
			count = 0;
		array.resize(count);
		for (i in 0...count) {
			array[i] = value;
		}
		return array;
	}

	/** Sets the size of the array, keeping its existing values. New elements are set to the given value. */
	public static function setSize<T>(array:Array<T>, count:Int, value:T) {
		if (count < 0)
			count = 0;
		var previous = array.length;
		array.resize(count);
		for (i in previous...count) {
			array[i] = value;
		}
		return array;
	}

	/** Reads an element without bounds checking on C++. The index must be valid. */
	public static inline function fastGet<T>(array:Array<T>, index:Int):T {
		#if cpp
		return untyped array.__unsafe_get(index);
		#else
		return array[index];
		#end
	}

	/** Writes an element without bounds checking on C++. The index must be within the array length. */
	public static inline function fastSet<T>(array:Array<T>, index:Int, value:T):Void {
		#if cpp
		untyped array.__unsafe_set(index, value);
		#else
		array[index] = value;
		#end
	}
}
