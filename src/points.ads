package Points is

   subtype nonNeg is Integer range 0..Integer'Last;
   type point is tagged
      record
         x_coord: nonNeg := 10000;
         y_coord: nonNeg := 10000;
      end record;
    
   function makePoint(x, y: nonNeg) return point;
   procedure printPoint(p: point);

end Points;
