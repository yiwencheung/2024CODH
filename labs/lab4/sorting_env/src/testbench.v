module sort_tb();

reg clk, rstn, start, prior, next;

always #10 clk = ~clk;

initial begin
    clk = 0; rstn = 0; start = 0; prior = 0; next = 0;
    #100
    rstn = 1; next = 1;
    #20
    next = 0; 
    #20  next = 1; #20 next = 0; #20 next = 1; #20 next = 0;
    #20
    start = 1;
    #8000
    start = 0;
    #20
    next = 1;
    #20
    next = 0; 
    #20
    next = 1; #20 next = 0; #20 next = 1; #20 next = 0; #20 next = 1;
end

sort_top st(
    .clk(clk),
    .rstn(rstn),
    .start(start),
    .prior(prior),
    .next(next),
    .seg(),
    .an()
);



endmodule