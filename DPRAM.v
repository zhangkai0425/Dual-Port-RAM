// implementation of dual-port-ram(Real)

module DPRAM (
    input clk,

    input ena,                  //enable signal of channel a
    input enb,                  //enable signal of channel b

    input wea,                  //enable write signal of channel a
    input web,                  //enable write signal of channel b

    input [7:0] addra,          //address of channel a
    input [7:0] addrb,          //address of channle b

    input [15:0] data_i_a,      //data input of channel a
    input [15:0] data_i_a,      //data input of channel b

    output reg [15:0] data_o_a, //data output of channel a
    output reg [15:0] data_o_b, //data output of channel b
);
reg [15:0] RAM [255:0];         //DATAWIDTH = 16, DEPTH = 256 = 2^8

always @(posedge clk) begin     
    if(ena) begin
        if(wea) begin
            RAM[addra] <= data_i_a;
        end
        data_o_a <= RAM[addra]
    end
end

always @(posedge clk) begin     //write channel
    if(enb) begin
        if(wea) begin
            RAM[addrb] <= data_i_b;
        end
        data_o_b <= RAM[addrb]
    end
end
endmodule