`include "uvm_macros.svh"
import uvm_pkg::*;

class register_item extends uvm_sequence_item;

    rand bit [14:0] control;
    rand bit serial_input_lsb;
    rand bit serial_input_msb;
    rand bit [7:0] parallel_input;

    bit serial_output_lsb;
    bit serial_output_msb;
    bit [7:0] parallel_output;

    `uvm_object_utils_begin(register_item)
        `uvm_field_int(control, UVM_DEFAULT | UVM_BIN)
        `uvm_field_int(serial_input_lsb, UVM_ALL_ON | UVM_BIN)
        `uvm_field_int(serial_input_msb, UVM_ALL_ON | UVM_BIN)
        `uvm_field_int(parallel_input, UVM_ALL_ON | UVM_BIN)
        `uvm_field_int(serial_output_lsb, UVM_NOPRINT)
        `uvm_field_int(serial_output_msb, UVM_NOPRINT)
        `uvm_field_int(parallel_output, UVM_NOPRINT)
    `uvm_object_utils_end

    function new(string name = "register_item");
        super.new(name);
    endfunction

    virtual function string convert2str();
        return $sformatf("control = %15b serial_input_lsb = %1b serial_input_msb = %1b parallel_input = %8b serial_output_lsb = %1b serial_output_msb = %1b parallel_output = %8b",
            control, serial_input_lsb, serial_input_msb, parallel_input, serial_output_lsb, serial_output_msb, parallel_output
        );
    endfunction

endclass

class generator extends uvm_sequence;

    `uvm_object_utils(generator)

    function new(string name = "generator");
        super.new(name);
    endfunction

    virtual task body();

        // CLEAR
        for (int i = 0; i < 3; i++) begin
            register_item item = register_item::type_id::create("item");
            start_item(item);
            item.randomize();
            item.control = 15'b000000000000001;
            `uvm_info("[GENERATOR]", $sformatf("Item %0d/%0d created CLEAR", i + 1, 3), UVM_LOW)
            item.print();
            finish_item(item);
        end

        // LOAD
        for (int i = 0; i < 3; i++) begin
            register_item item = register_item::type_id::create("item");
            start_item(item);
            item.randomize();
            item.control = 15'b000000000000010;
            `uvm_info("[GENERATOR]", $sformatf("Item %0d/%0d created LOAD", i + 1, 3), UVM_LOW)
            item.print();
            finish_item(item);
        end

        // LOAD vrednosti FEh
        for (int i = 0; i < 1; i++) begin
            register_item item = register_item::type_id::create("item");
            start_item(item);
            item.randomize();
            item.control = 15'b000000000000010;
            item.parallel_input = 8'hFE;
            `uvm_info("[GENERATOR]", $sformatf("LOADED FEh in REGISTER"), UVM_LOW)
            item.print();
            finish_item(item);
        end

        // INC
        for (int i = 0; i < 10; i++) begin
            register_item item = register_item::type_id::create("item");
            start_item(item);
            item.randomize();
            item.control = 15'b000000000000100;
            `uvm_info("[GENERATOR]", $sformatf("Item %0d/%0d created INC", i + 1, 10), UVM_LOW)
            item.print();
            finish_item(item);
        end

        // DEC
        for (int i = 0; i < 15; i++) begin
            register_item item = register_item::type_id::create("item");
            start_item(item);
            item.randomize();
            item.control = 15'b000000000001000;
            `uvm_info("[GENERATOR]", $sformatf("Item %0d/%0d created DEC", i + 1, 15), UVM_LOW)
            item.print();
            finish_item(item);
        end

        // ADD
        for (int i = 0; i < 10; i++) begin
            register_item item = register_item::type_id::create("item");
            start_item(item);
            item.randomize();
            item.control = 15'b000000000010000;
            `uvm_info("[GENERATOR]", $sformatf("Item %0d/%0d created ADD", i + 1, 10), UVM_LOW)
            item.print();
            finish_item(item);
        end

        // SUB
        for (int i = 0; i < 10; i++) begin
            register_item item = register_item::type_id::create("item");
            start_item(item);
            item.randomize();
            item.control = 15'b000000000100000;
            `uvm_info("[GENERATOR]", $sformatf("Item %0d/%0d created SUB", i + 1, 10), UVM_LOW)
            item.print();
            finish_item(item);
        end

        // INVERT
        for (int i = 0; i < 4; i++) begin
            register_item item = register_item::type_id::create("item");
            start_item(item);
            item.randomize();
            item.control = 15'b000000001000000;
            `uvm_info("[GENERATOR]", $sformatf("Item %0d/%0d created INVERT", i + 1, 4), UVM_LOW)
            item.print();
            finish_item(item);
        end

        // SERIAL INPUT LSB
        for (int i = 0; i < 5; i++) begin
            register_item item = register_item::type_id::create("item");
            start_item(item);
            item.randomize();
            item.control = 15'b000000010000000;
            `uvm_info("[GENERATOR]", $sformatf("Item %0d/%0d created SERIAL INPUT LSB", i + 1, 5), UVM_LOW)
            item.print();
            finish_item(item);
        end

        // SERIAL INPUT MSB
        for (int i = 0; i < 5; i++) begin
            register_item item = register_item::type_id::create("item");
            start_item(item);
            item.randomize();
            item.control = 15'b000000100000000;
            `uvm_info("[GENERATOR]", $sformatf("Item %0d/%0d created SERIAL INPUT MSB", i + 1, 5), UVM_LOW)
            item.print();
            finish_item(item);
        end

        // SHIFT LOGICAL LEFT
        for (int i = 0; i < 5; i++) begin
            register_item item = register_item::type_id::create("item");
            start_item(item);
            item.randomize();
            item.control = 15'b000001000000000;
            `uvm_info("[GENERATOR]", $sformatf("Item %0d/%0d created SHIFT LOGICAL LEFT", i + 1, 5), UVM_LOW)
            item.print();
            finish_item(item);
        end

        // LOAD vrednosti ACh
        for (int i = 0; i < 1; i++) begin
            register_item item = register_item::type_id::create("item");
            start_item(item);
            item.randomize();
            item.control = 15'b000000000000010;
            item.parallel_input = 8'hAC;
            `uvm_info("[GENERATOR]", $sformatf("LOADED ACh in REGISTER"), UVM_LOW)
            item.print();
            finish_item(item);
        end

        // SHIFT LOGICAL RIGHT
        for (int i = 0; i < 5; i++) begin
            register_item item = register_item::type_id::create("item");
            start_item(item);
            item.randomize();
            item.control = 15'b000010000000000;
            `uvm_info("[GENERATOR]", $sformatf("Item %0d/%0d created SHIFT LOGICAL RIGHT", i + 1, 5), UVM_LOW)
            item.print();
            finish_item(item);
        end

        // LOAD vrednosti ACh
        for (int i = 0; i < 1; i++) begin
            register_item item = register_item::type_id::create("item");
            start_item(item);
            item.randomize();
            item.control = 15'b000000000000010;
            item.parallel_input = 8'hAC;
            `uvm_info("[GENERATOR]", $sformatf("LOADED ACh in REGISTER"), UVM_LOW)
            item.print();
            finish_item(item);
        end

        // SHIFT ARITHMETIC LEFT
        for (int i = 0; i < 5; i++) begin
            register_item item = register_item::type_id::create("item");
            start_item(item);
            item.randomize();
            item.control = 15'b000100000000000;
            `uvm_info("[GENERATOR]", $sformatf("Item %0d/%0d created SHIFT ARITHMETIC LEFT", i + 1, 5), UVM_LOW)
            item.print();
            finish_item(item);
        end

        // LOAD vrednosti ACh
        for (int i = 0; i < 1; i++) begin
            register_item item = register_item::type_id::create("item");
            start_item(item);
            item.randomize();
            item.control = 15'b000000000000010;
            item.parallel_input = 8'hAC;
            `uvm_info("[GENERATOR]", $sformatf("LOADED ACh in REGISTER"), UVM_LOW)
            item.print();
            finish_item(item);
        end

        // SHIFT ARITHMETIC RIGHT
        for (int i = 0; i < 5; i++) begin
            register_item item = register_item::type_id::create("item");
            start_item(item);
            item.randomize();
            item.control = 15'b001000000000000;
            `uvm_info("[GENERATOR]", $sformatf("Item %0d/%0d created SHIFT ARITHMETIC RIGHT", i + 1, 5), UVM_LOW)
            item.print();
            finish_item(item);
        end

        // LOAD vrednosti 39h
        for (int i = 0; i < 1; i++) begin
            register_item item = register_item::type_id::create("item");
            start_item(item);
            item.randomize();
            item.control = 15'b000000000000010;
            item.parallel_input = 8'h39;
            `uvm_info("[GENERATOR]", $sformatf("LOADED 39h in REGISTER"), UVM_LOW)
            item.print();
            finish_item(item);
        end

        // ROTATE LEFT
        for (int i = 0; i < 5; i++) begin
            register_item item = register_item::type_id::create("item");
            start_item(item);
            item.randomize();
            item.control = 15'b010000000000000;
            `uvm_info("[GENERATOR]", $sformatf("Item %0d/%0d created ROTATE LEFT", i + 1, 5), UVM_LOW)
            item.print();
            finish_item(item);
        end

        // ROTATE RIGHT
        for (int i = 0; i < 5; i++) begin
            register_item item = register_item::type_id::create("item");
            start_item(item);
            item.randomize();
            item.control = 15'b100000000000000;
            `uvm_info("[GENERATOR]", $sformatf("Item %0d/%0d created ROTATE RIGHT", i + 1, 5), UVM_LOW)
            item.print();
            finish_item(item);
        end

        // RANDOM GENERISANE OPERACIJE
        for (int i = 0; i < 20; i++) begin
            register_item item = register_item::type_id::create("item");
            start_item(item);
            item.randomize();
            `uvm_info("[GENERATOR]", $sformatf("Item %0d/%0d created RANDOM GENERISANE OPERACIJE ", i + 1, 20), UVM_LOW)
            item.print();
            finish_item(item);
        end

    endtask

endclass

class driver extends uvm_driver #(register_item);

    `uvm_component_utils(driver)

    function new(string name = "driver", uvm_component parent = null);
        super.new(name, parent);
    endfunction

    virtual register_if vif;

    virtual function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        if(!uvm_config_db#(virtual register_if)::get(this, "", "register_vif", vif))
            `uvm_fatal("[DRIVER]", "Could not get virtual interface!")
    endfunction

    virtual task run_phase(uvm_phase phase);
        super.run_phase(phase);
        @(posedge vif.clk);
        forever begin
            register_item item;
            seq_item_port.get_next_item(item);
            `uvm_info("[DRIVER]", $sformatf("%s", item.convert2str()), UVM_LOW)
            vif.control <= item.control;
            vif.serial_input_lsb <= item.serial_input_lsb;
            vif.serial_input_msb <= item.serial_input_msb;
            vif.parallel_input <= item.parallel_input;
            @(posedge vif.clk);
            seq_item_port.item_done();
        end
    endtask

endclass

class monitor extends uvm_monitor;

    `uvm_component_utils(monitor)

    function new(string name = "monitor", uvm_component parent = null);
        super.new(name, parent);
    endfunction

    virtual register_if vif;
    uvm_analysis_port #(register_item) mon_analysis_port;

    virtual function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        if(!uvm_config_db#(virtual register_if)::get(this, "", "register_vif", vif))
            `uvm_fatal("[MONITOR]", "Could not get virtual interface!")
        mon_analysis_port = new("mon_analysis_port", this);
    endfunction

    virtual task run_phase(uvm_phase phase);
        super.run_phase(phase);
        @(posedge vif.clk);
        forever begin
            register_item item = register_item::type_id::create("item");
            @(posedge vif.clk);
            item.control = vif.control;
            item.serial_input_lsb = vif.serial_input_lsb;
            item.serial_input_msb = vif.serial_input_msb;
            item.parallel_input = vif.parallel_input;
            item.serial_output_lsb = vif.serial_output_lsb;
            item.serial_output_msb = vif.serial_output_msb;
            item.parallel_output = vif.parallel_output;
            `uvm_info("[MONITOR]", $sformatf("%s", item.convert2str()), UVM_LOW)
            mon_analysis_port.write(item);
        end
    endtask

endclass

class agent extends uvm_agent;

    `uvm_component_utils(agent)

    function new(string name = "agent", uvm_component parent = null);
        super.new(name, parent);
    endfunction

    monitor m0;
    driver d0;
    uvm_sequencer #(register_item) s0;

    virtual function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        m0 = monitor::type_id::create("m0", this);
        d0 = driver::type_id::create("d0", this);
        s0 = uvm_sequencer#(register_item)::type_id::create("s0", this);
    endfunction

    virtual function void connect_phase(uvm_phase phase);
        super.connect_phase(phase);
        d0.seq_item_port.connect(s0.seq_item_export);
    endfunction

endclass

class scoreboard extends uvm_scoreboard;

    `uvm_component_utils(scoreboard)

    function new(string name = "scoreboard", uvm_component parent = null);
        super.new(name, parent);
    endfunction

    uvm_analysis_imp #(register_item, scoreboard) mon_analysis_imp;

    virtual function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        mon_analysis_imp = new("mon_analysis_imp", this);
    endfunction

    bit [7:0] izlaz = 8'h00;
    bit lsb = 1'b0;
    bit msb = 1'b0;

    virtual function write(register_item item);

        if((izlaz == item.parallel_output) && (lsb == item.serial_output_lsb) && (msb == item.serial_output_msb))
            `uvm_info("[SCOREBOARD]", $sformatf("USPEH! Ocekivan izlaz = %8b dobijen izlaz = %8b, ocekivan lsb = %1b dobijen lsb = %1b, ocekivan msb = %1b dobijen msb = %1b", izlaz, item.parallel_output, lsb, item.serial_output_lsb, msb, item.serial_output_msb), UVM_LOW)
        else
             `uvm_error("[SCOREBOARD]", $sformatf("GRESKA! Ocekivan izlaz = %8b dobijen izlaz = %8b, ocekivan lsb = %1b dobijen lsb = %1b, ocekivan msb = %1b dobijen msb = %1b", izlaz, item.parallel_output, lsb, item.serial_output_lsb, msb, item.serial_output_msb))
    
        if(item.control[0]) begin
            izlaz = 8'h00;
            lsb = 1'b0;
            msb = 1'b0;
        end else if(item.control[1]) begin
            izlaz = item.parallel_input;
            lsb = 1'b0;
            msb = 1'b0;
        end else if(item.control[2]) begin
            if(izlaz == 8'hFF)
                msb = 1'b1;
            else
                msb = 1'b0;
            lsb = 1'b0;
            izlaz = izlaz + 8'h01;
        end else if(item.control[3]) begin
            if(izlaz == 8'h00)
                msb = 1'b1;
            else
                msb = 1'b0;
            lsb = 1'b0;
            izlaz = izlaz - 8'h01;
        end else if(item.control[4]) begin
            bit [8:0] carry_bits;
            carry_bits = 9'h000;
            for (int i = 0; i < 8; i++) begin
                if(izlaz[i] && item.parallel_input[i])
                    carry_bits[i + 1] = 1'b1;
                else if(izlaz[i] && !item.parallel_input[i] && carry_bits[i])
                    carry_bits[i + 1] = 1'b1;
                else if(!izlaz[i] && item.parallel_input[i] && carry_bits[i])
                    carry_bits[i + 1] = 1'b1;
                else
                    carry_bits[i + 1] = 1'b0;
            end
            if(carry_bits[8])
                msb = 1'b1;
            else
                msb = 1'b0;
            lsb = 1'b0;
            izlaz = izlaz + item.parallel_input;
        end else if(item.control[5]) begin
            bit [8:0] signed_substraction;
            signed_substraction = izlaz - item.parallel_input;
            if(signed_substraction[8])
                msb = 1'b1;
            else
                msb = 1'b0;
            lsb = 1'b0;
            izlaz = izlaz - item.parallel_input;
        end else if(item.control[6]) begin
            lsb = 1'b0;
            msb = 1'b0;
            izlaz = ~izlaz;
        end else if(item.control[7]) begin
            bit [7:0] temp;
            msb = izlaz[7];
            lsb = 1'b0;
            temp = 8'h00;
            temp = izlaz;
            for (int i = 1; i < 8; i++) begin
                izlaz[i] = temp[i-1];
            end
            izlaz[0] = item.serial_input_lsb;
        end else if(item.control[8]) begin
            lsb = izlaz[0];
            msb = 1'b0;
            izlaz = izlaz / 2;
            izlaz[7] = item.serial_input_msb;
        end else if(item.control[9]) begin
            bit [7:0] temp;
            msb = izlaz[7];
            lsb = 1'b0;
            temp = 8'h00;
            temp = izlaz;
            for (int i = 1; i < 8; i++) begin
                izlaz[i] = temp[i-1];
            end
            izlaz[0] = 1'b0;
        end else if(item.control[10]) begin
            lsb = izlaz[0];
            msb = 1'b0;
            izlaz = izlaz / 2;
            izlaz[7] = 1'b0;
        end else if(item.control[11]) begin
            bit [7:0] temp;
            msb = izlaz[7];
            lsb = 1'b0;
            temp = 8'h00;
            temp = izlaz;
            for (int i = 1; i < 8; i++) begin
                izlaz[i] = temp[i-1];
            end
            izlaz[0] = 1'b0;
        end else if(item.control[12]) begin
            bit previous_msb;
            previous_msb = izlaz[7];
            lsb = izlaz[0];
            msb = 1'b0;
            izlaz = izlaz / 2;
            izlaz[7] = previous_msb;
        end else if(item.control[13]) begin
            bit [7:0] temp;
            msb = izlaz[7];
            lsb = 1'b0;
            temp = 8'h00;
            temp = izlaz;
            for (int i = 1; i < 8; i++) begin
                izlaz[i] = temp[i-1];
            end
            izlaz[0] = temp[7];
        end else if(item.control[14]) begin
            bit previous_lsb;
            previous_lsb = izlaz[0];
            lsb = izlaz[0];
            msb = 1'b0;
            izlaz = izlaz / 2;
            izlaz[7] = previous_lsb;
        end

    endfunction

endclass

class env extends uvm_env;

    `uvm_component_utils(env)

    function new(string name = "env", uvm_component parent = null);
        super.new(name, parent);
    endfunction

    agent a0;
    scoreboard sb0;

    virtual function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        a0 = agent::type_id::create("a0", this);
        sb0 = scoreboard::type_id::create("sb0", this);
    endfunction

    virtual function void connect_phase(uvm_phase phase);
        super.connect_phase(phase);
        a0.m0.mon_analysis_port.connect(sb0.mon_analysis_imp);
    endfunction

endclass

class test extends uvm_test;

    `uvm_component_utils(test)

    function new(string name = "test", uvm_component parent = null);
        super.new(name, parent);
    endfunction

    virtual register_if vif;
    env e0;
    generator g0;

    virtual function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        if(!uvm_config_db#(virtual register_if)::get(this, "", "register_vif", vif))
            `uvm_fatal("[TEST]", "Could not get virtual interface!")
        e0 = env::type_id::create("e0", this);
        g0 = generator::type_id::create("g0");
    endfunction

    virtual function void end_of_elaboration_phase(uvm_phase phase);
        uvm_top.print_topology();
    endfunction

    virtual task run_phase(uvm_phase phase);
        phase.raise_objection(this);

        vif.rst_n <= 0;
        #20 vif.rst_n <= 1;

        g0.start(e0.a0.s0);

        phase.drop_objection(this);
    endtask

endclass

interface register_if(
    input bit clk
);

    logic rst_n;
    logic [14:0] control;
    logic serial_input_lsb;
    logic serial_input_msb;
    logic [7:0] parallel_input;
    logic serial_output_lsb;
    logic serial_output_msb;
    logic [7:0] parallel_output;
    
endinterface

module testbench;

    reg clk;

    register_if dut_if(.clk(clk));

    register dut (
        .clk(clk),
        .rst_n(dut_if.rst_n),
        .control(dut_if.control),
        .serial_input_lsb(dut_if.serial_input_lsb),
        .serial_input_msb(dut_if.serial_input_msb),
        .parallel_input(dut_if.parallel_input),
        .serial_output_lsb(dut_if.serial_output_lsb),
        .serial_output_msb(dut_if.serial_output_msb),
        .parallel_output(dut_if.parallel_output)
    );

    initial begin
        clk = 0;
        forever begin
            #10 clk = ~clk;
        end
    end

    initial begin
        uvm_config_db#(virtual register_if)::set(null, "*", "register_vif", dut_if);
        run_test("test");
    end
    
endmodule
