SECTIONS
{
    . = 0x08000000; 

    .text : {
        *(vector_table)
        *(.text)
    }

    .data : {
        *(.data)
    }

    .bss : {
        *(.bss)
    }
}
