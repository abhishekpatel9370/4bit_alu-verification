module Alu_verification ();
logic clk ;
logic rst ;
logic signed [3:0] A,B ;
logic [1:0] opcode ;
logic signed [4:0] C ;
 

// DUT instantiation 

alu4bit  utt1(.clk(clk),.rst(rst),.A(A),.B(B),.opcode(opcode),.C(C));

// Clock generation 
initial clk = 0 ;
always #5 clk =~clk ;

// Task to apply input ans wait for result 

task apply_inputs(input signed [3:0] a_in ,b_in,input [1:0] op);
	A =a_in ;
	B =b_in ; 
	opcode =op ;
	@(posedge clk);
	#1 ;
	$display("A =%0d B=%0d OPCODE =%b -> C=%0d",A,B,opcode,C);
endtask 

// Test procedure 
initial begin 
	$display("Starting ALU Test ..");
	rst =1 ;
	A=0 ;B=0; opcode = 0;
	#3 rst =0 ;
	
	// Add tests 
	apply_inputs(4,3,2'b00); // 4+4
	apply_inputs(-4,2,2'b00); // -4 +2 

	// Sub Tests
	apply_inputs(5,1,2'b01);  // 5-1 
	apply_inputs(-3,-4,2'b01); // -3 -(-4)
 

// Inverts A 
	apply_inputs(4,0,2'b10); // ~4
	apply_inputs(-2,0,2'b10); //~ -2 

// resuction Or of B 
	apply_inputs(10,4'b1010,2'b11);
	apply_inputs(0,4'b0000,2'b11); 

	$display("Test completed  ");

	#10 $finish ;
end
endmodule
