`timescale 1ns/100ps
`include "TPRAM.v"
module real_dual_port_ram_tb ();
reg          clk,wea,enb                    ; 
reg   [7:0]  addra,addrb                    ;
reg   [15:0] data_i_a                       ;
wire   [15:0] data_o_b                       ;

always #5 clk = ~clk;
// instantiation
TPRAM inst_TPRAM(
    .clk(clk),
    .wea(wea),
    .enb(enb),
    .addra(addra),
    .addrb(addrb),
    .data_i_a(data_i_a),
    .data_o_b(data_o_b)
);
initial begin
    clk <= 0;
    #25
    wea<=1;enb<=1;addra<=8'd0;addrb<=8'd0;data_i_a<=16'd9;
    #20
    wea<=1;enb<=1;addra<=8'd1;addrb<=8'd1;data_i_a<=16'd2;
    #20
    wea<=1;enb<=1;addra<=8'd2;addrb<=8'd2;data_i_a<=16'd7;
    #20
    wea<=1;enb<=1;addra<=8'd3;addrb<=8'd3;data_i_a<=16'd7;
end

/*iverilog */
initial begin
    $dumpfile("waveform_TPRAM.vcd");//generate waveform file
    $dumpvars;//or $dumpvars;
    #200 //simulation time
    $finish;
end
/*iverilog */

endmodule