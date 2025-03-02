module two_s_complement(In,Out);
    input [3:0] In;
    output [3:0] Out;
    
    wire i3=In[3];
    wire i2=In[2];
    wire i1=In[1];
    wire i0=In[0];
    
    assign Out[3] = (~i3 & i0) | (~i3 & i1) | (~i3 & i2) | (i3 & ~i2 & ~i1 & ~i0);
    assign Out[2] = (~i2 & i0) | (~i2 & i1) | (i2 & ~i1 & ~i0);
    assign Out[1] =  (~i1 & i0) | (i1 & ~i0);
    assign Out[0] = (i0);


endmodule  
