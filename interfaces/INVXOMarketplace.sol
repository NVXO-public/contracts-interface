// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title INVXOMarketplace — NFT and digital asset marketplace interface
/// @dev EIP-2981 royalties · English/Dutch auctions · lazy mint support
interface INVXOMarketplace {
    enum ListingType { FIXED_PRICE, ENGLISH_AUCTION, DUTCH_AUCTION, SEALED_BID }
    struct Listing {
        uint256 listingId;
        address seller;
        address nftContract;
        uint256 tokenId;
        address paymentToken;
        uint256 price;
        ListingType listingType;
        uint256 startTime;
        uint256 endTime;
        bool active;
    }
    function createListing(address nftContract, uint256 tokenId, address paymentToken, uint256 price, ListingType listingType, uint256 duration) external returns (uint256 listingId);
    function buy(uint256 listingId) external payable;
    function makeOffer(uint256 listingId, uint256 offerAmount, uint256 expiresAt) external;
    function acceptOffer(uint256 listingId, address offeror) external;
    function placeBid(uint256 listingId, uint256 bidAmount) external;
    function cancelListing(uint256 listingId) external;
    function getListing(uint256 listingId) external view returns (Listing memory);
    function platformFee() external view returns (uint256);
    event Listed(uint256 indexed listingId, address indexed seller, address nftContract, uint256 tokenId, uint256 price);
    event Sold(uint256 indexed listingId, address indexed buyer, uint256 price);
    event BidPlaced(uint256 indexed listingId, address indexed bidder, uint256 amount);
    event RoyaltyPaid(address indexed creator, uint256 amount);
}