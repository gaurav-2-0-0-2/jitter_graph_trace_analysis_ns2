#!/usr/bin/awk -f

BEGIN {
    # Initialize variables
    old1 = 0;
    old2 = 0;
}

{
  if ($1 == "r" && $3 == 2 && $4 == 3 && $5 == "cbr") {
    dif = $11 - old2;
    if (dif == 0) dif = 1;
    if (dif > 0) {
      printf("%d\t%f\n", $11, ($2 - old1) / dif);
      old1 = $2;
      old2 = $11;
    }
  }
}

END {
    # Print the average jitter
    if (packet_count > 0) {
        printf "Average jitter: %f\n", total_jitter / packet_count;
    } else {
        print "No packets found";
    }
}
