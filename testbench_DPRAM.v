`timescale 1ns/1ps
module real_dual_port_ram_tb ();
reg          clka,clkb,ena,enb,wea,web     ; 
reg   [7:0]  addra,addrb                   ;
reg   [15:0] data_i_a,data_i_b             ;
reg   [15:0] data_o_a,data_o_b             ;

always #5 clka = ~clka;
always #5 clkb = ~clkb;

initial begin
    clka <= 0;
    clkb <= 0;
    #25
    ena<=1;enb<=1;wea<=1;web<=1;addra<=8'd0;addrb<=8'd1;data_i_a<=16'd9;data_i_b<=16'd10;
    #20
    ena<=1;enb<=1;wea<=1;web<=1;addra<=8'd2;addrb<=8'd3;data_i_a<=16'd7;data_i_b<=16'd7;
    #20
    ena<=1;enb<=1;wea<=1;web<=1;addra<=8'd4;addrb<=8'd5;data_i_a<=16'd6;data_i_b<=16'd8;
    #20
    ena<=1;enb<=1;wea<=1;web<=1;addra<=8'd2;addrb<=8'd3;data_i_a<=16'd0;data_i_b<=16'd0;
end
endmodule