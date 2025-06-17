module alu4bit (
    input  logic              clk,
    input  logic              rst,
    input  logic signed [3:0] A,
    input  logic signed [3:0] B,
    input  logic       [1:0]  opcode,
    output logic signed [4:0] C
);

    // Sequential logic block
    always_ff @(posedge clk or posedge rst) begin
        if (rst) begin
            C <= 5'sd0;
        end else begin
            case (opcode)
                2'b00: C <= A + B;                    // Add
                2'b01: C <= A - B;                    // Sub
                2'b10: C <= ~A;                       // Bitwise invert
                2'b11: C <= {4'd0, B[0]|B[1]|B[2]|B[3]}; // Reduction OR 
                default: C <= 5'sd0;
            endcase
        end
    end

endmodule

