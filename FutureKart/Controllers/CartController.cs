using AutoMapper;
using FutureKart.Business;
using FutureKart.Filter;
using FutureKart.Shared.DTO.Cart;
using FutureKart.Shared.DTO.Category;
using FutureKart.Shared.DTO.Product;
using FutureKart.Shared.DTO.Variant;
using FutureKart.Shared.Exceptions;
using FutureKart.View_Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace FutureKart.Controllers
{
    [UserAuthFilter]
    public class CartController : Controller
    {
        CartBusinessContext CartBusinessContextObject;
        IMapper CartMapper;
        //IMapper CartInfoMapper;
        IMapper CartInfoMapper;
        public CartController()
        {
            CartBusinessContextObject = new CartBusinessContext();
            var cartMappingconfig = new MapperConfiguration(cfg => {
                cfg.CreateMap<CartViewModel, CartDTO>();
            });

            var cartItemsMappingConfig = new MapperConfiguration(cfg =>
            {
                cfg.CreateMap<ProductDTO, ProductViewModel>();
                cfg.CreateMap<VariantDTO, VariantViewModel>();
                cfg.CreateMap<CartProductsDTO, CartProductsViewModel>();
            });
            var cartInfoMappingConfig = new MapperConfiguration(cfg =>
            {

                cfg.CreateMap<ProductDTO, ProductViewModel>();
                cfg.CreateMap<VariantDTO, VariantViewModel>();
                cfg.CreateMap<CartProductsDTO, CartProductsViewModel>();
                cfg.CreateMap<CartItemsDTO, CartItemsViewModel>();
                cfg.CreateMap<VariantImageDTO, VariantImageViewModel>();
                cfg.CreateMap<CategoryProductsDTO, CategoryProductViewModel>();

            });
            CartMapper = new Mapper(cartMappingconfig);
            CartInfoMapper = new Mapper(cartInfoMappingConfig);
        }

        public ActionResult AddItem([Bind(Include = "VariantID, ProductID, Quantity,OrderLimit, Inventory")] CartViewModel cartViewModel)
        {
            try
            {
                CartMessagesViewModel cartMessagesViewModel = new CartMessagesViewModel();

                if (ModelState.IsValid)
                {
                    CartDTO cartDTO = CartMapper.Map<CartViewModel, CartDTO>(cartViewModel);
                    cartDTO.UserID = new Guid(Session["UserID"].ToString());
                    try
                    {
                        CartBusinessContextObject.AddItemToCart(cartDTO);
                        cartMessagesViewModel.SuccessMessage = "Item Successfuly added to cart";
                        return View(cartMessagesViewModel);
                    }
                    catch (ItemAlreadyInCartException)
                    {
                        cartMessagesViewModel.ErrorMessages.Add("Item is already present in the Cart");
                        return View(cartMessagesViewModel);
                    }
                    catch (QuantityUnavailableException)
                    {
                        cartMessagesViewModel.ErrorMessages.Add("quantity unavailable");
                        return View(cartMessagesViewModel);
                    }
                    catch (OrderLimitExceedException)
                    {
                        cartMessagesViewModel.ErrorMessages.Add("order quantity exceed limit");
                        return View(cartMessagesViewModel);
                    }
                    catch (Exception ex)
                    {
                        return View("Internal Error" + ex);
                    }
                }
                else
                {
                    foreach (var modelStateValue in ModelState.Values)
                    {
                        foreach (var modelStateError in modelStateValue.Errors)
                        {
                            cartMessagesViewModel.ErrorMessages.Add(modelStateError.ErrorMessage.ToString());
                        }
                    }
                    return View(cartMessagesViewModel);
                }
            }catch(Exception ex)
            {
                return RedirectToAction("ExceptionCatch", "Static", new { exception = ex });
            }
        }

        public ActionResult ViewCart()
        {
            try
            {
                CartItemsDTO CartInfoDTO = CartBusinessContextObject.GetCart(new Guid(Session["UserID"].ToString()));
                CartItemsViewModel cartItemsViewModel = new CartItemsViewModel();
                cartItemsViewModel = CartInfoMapper.Map<CartItemsDTO, CartItemsViewModel>(CartInfoDTO);
                return View(cartItemsViewModel);
            }
            catch(Exception ex)
            {
                return RedirectToAction("ExceptionCatch", "Static", new { exception = ex });
            }
        }

        public ActionResult RemoveItem(Guid VariantID)
        {
            try
            {
                CartBusinessContextObject.RemoveItemFromCart(new Guid(Session["UserID"].ToString()), VariantID);
                return RedirectToAction("ViewCart");
            }catch(Exception ex)
            {
                return RedirectToAction("ExceptionCatch", "Static", new { exception = ex });
            }
        }
    }
}