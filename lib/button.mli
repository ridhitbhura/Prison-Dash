(**constants.ml/constants.mli file, stores all button names, allows you
   to search button list for certain things*)

type t
(**The abstract type representing a button.*)

type dimen = {
  x_range : int * int;
  y_range : int * int;
}
(** The [x_range] and [y_range] dictate the boundaries of the button.*)

val is_clicked : t -> bool
(**[is_clicked button] is whether the button was clicked.*)

val click : t -> t
(**[click button] changes the status of the button to clicked.*)

val unclick : t -> t
(**[unclick button] changes the status of the button to unclicked.*)

val is_dimmed : t -> bool
(**[is_dimmed button] is whether the button is currently active.*)

val dim : t -> t
(**[dim button] deactivates [button] making it unclickable.*)

val undim : t -> t
(**[undim button] reactvates [button] making it clickable.*)

val dimension : t -> dimen
(**[dimension button] gives the dimensions of the button with respect to
   the game screen.*)

val compute_dimension : int -> int -> int -> int -> dimen
(**[compute_dimension x_coord y_coord width height] is the dimensions
   based on [x_coord],[y_coord],[width], and [height].*)

val image : t -> string option
(**[image button] is current button image to display if it exists,
   [None] otherwise.*)

val x_coord : t -> int
(**[x_coord button] is the x coordinate location of the button relative
   to the display.*)

val y_coord : t -> int
(**[y_coord button] is the y coordinate location of the button relative
   to the display.*)

val name : t -> string
(**[name button] is the unique name of the button.*)

val get_button_from_json : Yojson.Basic.t -> t
(**[get_button_from_json j] is the button that j represents.*)

val get_buttons_from_json : Yojson.Basic.t -> t list
(**[get_button_from_json j] is the list of buttons that j represents.*)
