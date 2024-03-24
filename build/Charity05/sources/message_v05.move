module charity_protocol::message_v05 {
    use std::error;
    use std::signer;
    use std::string;
    use aptos_framework::event;
    use aptos_framework::coin::transfer;
    use aptos_framework::aptos_coin::AptosCoin;
    use std::string::String;
    use std::coin::Coin;
    use std::signer::address_of;

    struct Charity has key {
        owner: address,
        minimum_contribution: u128,
        description: string::String,
        value: u128,
        recipient: address,
        now_request: bool,
        approval_count: u128,
    }

    fun init_module(owner: &signer) {
        let owner_addr = signer::address_of(owner);
        let empty_description = string::utf8(b"");
        let charity = Charity {
            owner: owner_addr,
            minimum_contribution: 1,
            description: empty_description,
            value: 0,
            recipient: owner_addr,//In the init method, temporarily store the owner's address.
            now_request: false,
            approval_count: 0,
        };
        move_to(owner, charity); 
    }
    #[view]
    public fun get_minimum(account_addr: address): u128 acquires Charity {
        let charity_ref = borrow_global<Charity>(account_addr);
        charity_ref.minimum_contribution
    }
    #[view]
    public fun get_description(account_addr: address): string::String acquires Charity {
        let charity_ref = borrow_global<Charity>(account_addr);
        charity_ref.description
    }
    #[view]
    public fun get_value(account_addr: address): u128 acquires Charity {
        let charity_ref = borrow_global<Charity>(account_addr);
        charity_ref.value
    }
    #[view]
    public fun get_recipient(account_addr: address): address acquires Charity {
        let charity_ref = borrow_global<Charity>(account_addr);
        charity_ref.recipient
    }

    public entry fun create_request(owner_addr: address, description: string::String, value: u128, recipient: address) acquires Charity {
        let charity_ref = borrow_global_mut<Charity>(owner_addr);
        charity_ref.description = description;
        charity_ref.value = value;
        charity_ref.recipient = recipient;
        charity_ref.now_request = true;
    }

    public entry fun send_apt(from: &signer, owner_addr: address, amount: u64) acquires Charity {
        let charity_ref = borrow_global<Charity>(owner_addr);
        transfer<AptosCoin>(from, charity_ref.recipient, amount)
    }
    public fun approve_request(charity: &mut Charity) {
        // TODO: Implement the function logic here.
    }

    public fun finalize_request(charity: &mut Charity) {
        // TODO: Implement the function logic here.
    }

}