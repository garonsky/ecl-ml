﻿// Some configuration constants; tweaking these numbers to fit your system may help performance
EXPORT Config := MODULE
  EXPORT MaxLookup := 1000000000; // At most 1GB of lookup data
  END;