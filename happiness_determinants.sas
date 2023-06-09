data ip;
    Input P C S Y;
    datalines;
    2 1 1 8
    2 1 1 6
    1 1 2 6
    2 0 2 8
    1 2 1 7
    2 1 1 7
    1 1 2 7
    1 2 2 9
    2 2 1 8
    2 1 2 9
    2 2 1 7
    1 2 2 7
    2 1 2 6
    2 2 2 10
    1 2 1 6
    2 2 0 8
    2 1 1 6
    1 1 2 7
    0 2 2 7
    1 2 1 7
    1 1 2 7
    1 2 1 6
    1 1 1 5
    1 0 2 5
    2 0 1 6
    1 1 1 4
    1 1 1 5
    2 1 0 6
    1 2 0 6
    2 0 1 7
    1 1 1 5
    2 1 0 6
    0 1 2 6
    1 1 0 4
    0 1 1 2
    0 1 1 4
    1 0 1 5
    0 0 2 6
    0 1 1 5
    1 1 0 4
    2 0 0 5
    1 0 1 4
    1 1 0 4
    1 0 1 4
    1 1 1 6
    1 2 0 7
    0 2 1 6
    1 1 1 4
    1 1 1 4
    0 1 2 6
    1 0 2 7
    0 2 1 7
    1 1 1 4
    0 2 0 5
    1 0 1 6
    0 1 1 6
    1 1 0 7
    1 0 0 4
    0 0 1 4
    0 1 0 6
    0 0 1 5
    1 0 0 2
    0 1 0 3
    0 0 0 0
    0 0 0 0
    2 2 2 10
    ;
    proc glm data=ip;
    class P C S;
    model Y=P C S P*C P*S C*S P*C*S;
    output out=out r=res p=pred;
    means P C S P*C P*S C*S P*C*S;
    run;
    PROC univariate data=out normal;
    var res;
    qqplot res /normal(MU=0 SIGMA=EST);
    run;
    proc sgplot data=out;
    scatter x=pred y=res;
    refline 0;
    run;
    proc glm data=ip;
    class P C S;
    model Y=P C S P*C P*S C*S P*C*S;
    run;
    
    
    