`timescale 1ns/1ps

module thingTest;

reg clk;
reg reset;
wire done;
wire [7:0] letter;

    thing dut (
        .clk(clk),
        .reset(reset),
        .letter(letter),
        .done(done)
    );

always #5 clk = ~clk;

initial begin
    // set starting values
    clk = 0;
    reset = 1;

    $dumpfile("thingDump.vcd");
    $dumpvars(0, thing);

    // start the timulation
    #20 reset = 0;

    repeat (13) begin
        #10 $display("Time: %0tps, Letter: %s", $time, letter);
    end

    #200 $finish;
end

always @(posedge clk) begin
    if (done) begin
        reset <= 1;
    end
end

endmodule
