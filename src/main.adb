with Ada.Text_IO;  use Ada.Text_IO;
with Ada.Integer_Text_IO;  use Ada.Integer_Text_IO;
with Points; use Points;
with Units; use Units;
with DistanceAndBearing; use DistanceAndBearing;

procedure Main is
   subtype nonNeg is Integer range 0..Integer'Last;
   looper: Character := 'y';
   x_coord: nonNeg;
   y_coord: nonNeg;
   p: point;
   d: dandb;
   u: unit;
begin
   Put_Line("");
   Put_Line("Welcome to gunnery: ");
   while looper = 'y' or looper = 'Y' loop
      Put_Line("");
      Put("Input x-coordinate of target: ");
      Get(x_coord);
      Put("Input y-coordinate of target: ");
      Get(y_coord);

      p:= makePoint(x_coord, y_coord);
      printPoint(p);
      Put_Line("");

      d:= makeDandB(u.position, p);
      printDandB(d);

      Put("Would you like to input more?  ('y' or 'Y' for yes) ");
      Get(looper);
      Put_Line("");
   end loop;
   Put_Line("");
   Put_Line("Thank you for using Gunnery.");
   Put_Line("");

end Main;
