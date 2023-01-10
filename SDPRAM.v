// implementation of simple dual port ram

module simple_dual_port_ram (
    input clk,

    input wea,                  //enable write signal of channel a
    input enb,                  //enable read signal of channel b

    input [7:0] addra,          //address of channel a
    input [7:0] addrb,          //address of channle b

    input [15:0] data_i_a,      //data input of channel a
    output reg [15:0] data_o_b, //data output of channel b
);
reg [15:0] RAM [255:0];         //DATAWIDTH = 16, DEPTH = 256 = 2^8

always @(posedge clk) begin     //write channel
    if(wea) begin
        ram[addra] <= data_i_a;
    end
end

always @(posedge clk) begin    //read channel
    if(enb) begin
        data_o_b <= ram[addrb]
    end
end
endmodule