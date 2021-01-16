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

path ngon(path segment = (0, 0)--E, int n = 3, bool cw = false,
    int first = 0, int last = length(segment)) {
  real theta = 360/n;
  pair A, B;

  path ngon;
  real tol = 1e-12;
  
  if (cw) {theta = -theta;}

  for(int i = 0; i < n; ++i){
    A = point(segment, first);
    B = point(segment, last);
    if (length(ngon) >= 0 && 
        length(point(ngon, length(ngon)) - point(segment, 0)) < tol && 
        straight(segment, 0)) {
      ngon  = ngon--subpath(segment, 1, length(segment));
        } else{
      ngon  = ngon--segment;        
        }
    segment = rotate(theta, B) * shift(B - A) * segment;
  }
  
  if (length(point(ngon, 0) -  point(ngon, length(ngon))) < tol) {
    ngon = subpath(ngon, 0, length(ngon) - 1);
  }
  ngon = ngon--cycle;
  return ngon;
}
