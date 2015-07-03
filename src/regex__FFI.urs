(* Copyright 2015 the Massachusetts Institute of Technology

Licensed under the Apache License, Version 2.0 (the "License"); you may not use
this file except in compliance with the License.  You may obtain a copy of the
License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software distributed
under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR
CONDITIONS OF ANY KIND, either express or implied.  See the License for the
specific language governing permissions and limitations under the License. *)

(* This is an internal module.  You should use the high-level API in Regex
instead. *)


(* A compiled regular expression. *)
type regex

(* Data about a match.  There is no function which returns all subexpression
matches, as we can't build an Ur list in C. *)
type match
val succeeded : match -> bool
val n_subexpression_matches : match -> int
val subexpression_match : match -> int -> string


(* Compiles a regular expression from a POSIX extended regular expression
string. *)
val compile : bool (* case sensitive? *) -> string -> regex

(* Matches a regular expression against any part of a string. *)
val do_match : regex -> string -> match