// shapes.asy
// 
// shapes module
// 
//    Copyright 2021 Sean Carmody
// 
//    Licensed under the Apache License, Version 2.0 (the "License");
//    you may not use this file except in compliance with the License.
//    You may obtain a copy of the License at
// 
//        http://www.apache.org/licenses/LICENSE-2.0
// 
//    Unless required by applicable law or agreed to in writing, software
//    distributed under the License is distributed on an "AS IS" BASIS,
//    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//    See the License for the specific language governing permissions and
//    limitations under the License.

path ngon(int n = 3, path segment = (0, 0)--E) {
  real theta = 360/n;
  pair A, B;

  int last = size(segment);
  path ngon;

  for(int i = 0; i < n; ++i){
    A = point(segment, 0);
    B = point(segment, last);
    ngon  = ngon--segment;
    segment = rotate(theta, B) * shift(B - A) * segment;
  }
  ngon = ngon--cycle;
  return ngon;
}
