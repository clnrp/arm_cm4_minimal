ENTRY(Reset_Handler)   /* entry point */

_estack = 0x20020000;   /* end of RAM */
_Min_Heap_Size = 0x200;
_Min_Stack_Size = 0x400;

MEMORY
{
  FLASH (rx) : ORIGIN = 0x08000000, LENGTH = 1024K
  RAM (xrw)  : ORIGIN = 0x20000000, LENGTH = 128K
}

SECTIONS
{

  /* written in flash */
  .text :
  {
    *(.isr_vector)
    *(.text)
    *(.text.*)
    *(.init)
    *(.fini)
    *(.rodata)
    *(.rodata.*)
    . = ALIGN(4);
    _etext = .;        /* end of code */
  } >FLASH

  /* used by the startup to initialize data */
  _sidata = LOADADDR(.data);

  .data : 
  {
    _sdata = .;        /* data start */
    *(.data)
    *(.data*)
    . = ALIGN(4);
    _edata = .;        /* end of data */
  } >RAM AT> FLASH
  
  .bss :
  {
    _sbss = .;         /* bss start */
    __bss_start__ = _sbss;
    *(.bss)
    *(.bss*)
    *(COMMON)
    . = ALIGN(4);
    _ebss = .;         /* end of bss */
    __bss_end__ = _ebss;
  } >RAM

}


