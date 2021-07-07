module branch (
    input [31:0] data1,
    input [31:0] data2, 
    input brun,     //1 no signal, 0 with signal
    output reg breq,
    output reg brlt
);

always @(*) begin
    if(brun == 'b0)begin	//have signal 
        if ((data1[31] ^ data2[31])==0) begin	// same 
            if (data1[30:0] == data2[30:0]) begin
                breq = 'b1;
                brlt = 'b0;
            end 
            else if (data1[30:0] < data2[30:0]) begin 
                brlt = 'b1;
                breq = 'b0;
            end 
            else begin
                breq = 'b0;
                brlt = 'b0;
            end
        end else if (data1[31]== 'b1 && data2[31]== 'b0)begin
            breq = 'b0;
            brlt = 'b1;
        end else  begin
            breq = 'b0;
            brlt = 'b0;
        end
    end else begin		// no signal 
	if (data1 == data2) begin
            breq = 'b1;
            brlt = 'b0;
        end 
        else if (data1 < data2) begin 
            brlt = 'b1;
            breq = 'b0;
        end 
        else begin
            breq = 'b0;
            brlt = 'b0;
        end
    end 
end
    
endmodule