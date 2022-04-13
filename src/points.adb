with Ada.Text_IO;  use Ada.Text_IO;

package body Points is
   
   function makePoint(x, y: nonNeg) return point is
      p: point := (x, y);
      begin
      return p;
      end makePoint;
      
   procedure printPoint(p: point) is
   begin
      Put_Line("The point is: " & p.x_coord'Image & " " & p.y_coord'Image);
      end printPoint;

end Points;
