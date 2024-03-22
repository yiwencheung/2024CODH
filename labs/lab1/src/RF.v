module RegisterFile (
    input           clk,		//时钟
    input   [4:0]   ra0, ra1,	//读地址
    output  [31:0]  rd0, rd1,	//读数据
    input   [4:0]   wa,		    //写地址
    input   [31:0]  wd,	        //写数据
    input           we		    //写使能

);

reg [31:0]  x[0:31]; 	//寄存器堆

assign rd0 = (we & (wa == ra0) & (wa != 0)) ? wd : x[ra0]; 	//读操作,写优先
assign rd1 = (we & (wa == ra1) & (wa != 0)) ? wd : x[ra1];

initial x[0] = 0;

always  @(posedge  clk) begin
    if (we & wa)            //x[0]不允许修改
         x[wa]  <=  wd;   //同步写入
end
endmodule