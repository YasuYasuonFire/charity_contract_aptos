module charity_protocol::message {
    use std::error;
    use std::signer;
    use std::string;
    use std::option::Option;
    use aptos_framework::event;

    use std::string::String;
    use std::coin::Coin;

    struct Campaign has key {
        owner: address,
        minimum_contribution: u128,
        description: string::String,
        value: u128,
        recipient: address,
        now_request: bool,
        approval_count: u128,
    }

    public fun new(minimum: u128, owner: address): Campaign {
        Campaign {
            owner: owner,
            minimum_contribution: minimum,
            description: string::utf8(b""),
            value: 0,
            recipient: owner,//In the new method, temporarily store the owner's address.
            now_request: false,
            approval_count: 0,
        }
    }

    public fun get_minimum(campaign: &Campaign): u128 {
        campaign.minimum_contribution
    }

    public fun get_description(campaign: &Campaign): string::String {
        campaign.description
    }

    public fun get_value(campaign: &Campaign): u128 {
        campaign.value
    }

    public fun get_recipient(campaign: &Campaign): address {
        campaign.recipient
    }

    public fun create_request(campaign: &mut Campaign, description: string::String, value: u128, recipient: address) {
        campaign.description = description;
        campaign.value = value;
        campaign.recipient = recipient;
        campaign.now_request = true;
    }

    public fun approve_request(campaign: &mut Campaign) {
        // TODO: Implement the function logic here.
    }

    public fun finalize_request(campaign: &mut Campaign) {
        // TODO: Implement the function logic here.
    }
}