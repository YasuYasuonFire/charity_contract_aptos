module charity_protocol::message_v06 {
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
        minimum_contribution: u128,//minimum amount of donation per one sending.
        description: string::String,
        value: u128,//value needed for one proposal
        recipient: address,
        now_request: bool,
        approval_count: u128,
    }

    fun init_module(owner: &signer) {
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

    public entry fun create_request(
        owner: &signer,
        minimum_contribution: u128,
        description: string::String,
        value: u128,
        recipient: address
    ) {
        let owner_addr = signer::address_of(owner);
        let charity = Charity {
            owner: owner_addr,
            minimum_contribution: minimum_contribution,
            description: description,
            value: value,
            recipient: recipient,
            now_request: true,
            approval_count: 0,
        };
        move_to(owner, charity);
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