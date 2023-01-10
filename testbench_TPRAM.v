`timescale 1ns/1ps
module real_dual_port_ram_tb ();
reg          clk,wea,enb                    ; 
reg   [7:0]  addra,addrb                    ;
reg   [15:0] data_i_a                       ;
reg   [15:0] data_o_b                       ;

always #5 clk = ~clk;

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
endmodule